var http = require('http');
var fs = require('fs');

//////////// DB설정 //////////////////
var express = require('express');
var oracledb = require('oracledb');
oracledb.autoCommit = true;
var conn;
oracledb.getConnection({
	user:"c##fighting",
	password : "c##fighting",
	connectString : "bitcamp4.iptime.org:1521/xe"},
	function(error, con){
		if(error){
			console.log("DB연결 실패"+error);
		}else{
			console.log("DB연결 성공");
			conn = con;
		}
});

var app = express();
var server = http.createServer(app);
var ejs = require('ejs');
var bodyParser = require('body-parser');

app.use(express.static(__dirname));
app.use(bodyParser.urlencoded({extended:true}));

app.get("/chatForm", function(req, res){
	var sender = req.param('sender');
	var receiver = req.param('receiver');
	var roomcode = req.param('roomcode');
	console.log('chatForm 접속.. 보낸이=%s, 받는이=%s', sender, receiver);
	var sql = "select otonum, ordernum, productnum, receiver, sender, to_char(otodate, 'YYYY/MM/DD HH:MI:SS') as otodate, otocontent, "+
				" (select min(otonum) from oto where (receiver='tester' and sender='qwer') or (receiver='qwer' and sender='tester')) as code "+
				" from oto where ((receiver = '"+sender+"' and sender = '"+receiver+"') or (sender='"+sender+"' and receiver = '"+receiver+"')) and roomcode="+ roomcode+" order by otonum"
	console.log("writeOk sql->"+sql);
	var sql2 = "select * from roomoto "+
				"where ((creator='"+sender+"' and receiver='"+receiver+"') or (creator='"+receiver+"' and receiver='"+sender+"')) and (cre_out>0 and rec_out>0) and (roomcode>="+roomcode+" or roomcode<"+roomcode+") and rownum<=1 order by roomcode desc";
	console.log("sql2-> "+sql2);
	conn.execute(sql2, function(error2, result2){
		if(error2){
			console.log("sql2 결과 : 실패")
		}else{
			var sql2Result = result2.rows.length;
			console.log(sql2Result);
			if(sql2Result>0){
				console.log("sql2쪽으로 넘어옴- "+result2.rows[0][0]);
				roomcode = result2.rows[0][0];
				sql = "select otonum, ordernum, productnum, receiver, sender, to_char(otodate, 'YYYY/MM/DD HH:MI:SS') as otodate, otocontent, "+
				" (select min(otonum) from oto where (receiver='tester' and sender='qwer') or (receiver='qwer' and sender='tester')) as code "+
				" from oto where ((receiver = '"+sender+"' and sender = '"+receiver+"') or (sender='"+sender+"' and receiver = '"+receiver+"')) and roomcode="+ roomcode+" order by otonum";
				if(sql2Result>0){
					conn.execute(sql, function(error, result){
						if(error){
							res.writeHead(200, {"Content-type":"text/html;charset=utf-8"});
							res.write("<script>");
							res.write("alert('error_code : 001')");
							res.end("</script>");
						}else{
							fs.readFile(__dirname+"\\chatForm.ejs",'utf-8', function(error, data){
								if(error){
									res.writeHead(200, {"Content-type":"text/html;charset=utf-8"});
									res.write("<script>");
									res.write("alert('error_code : 002');");
									res.end("</script>");
								}else{
									var totalRecord = result.rows.length;
									res.writeHead(200, {"Content-type":"text/html;charset=utf-8"});
									res.end(ejs.render(data, {
										results : result,
										totalRecord : totalRecord,
										sender:sender,
										receiver : receiver,
										roomcode : roomcode
									}))
								}
							})
						}
					});// sql.execute
				}
			}else{
				sql3 = "insert into roomoto(roomcode, creator, receiver, roomdate) "+
						" values(roomotosq.nextval,'"+sender+"', '"+receiver+"', sysdate)";
				console.log("sql3="+sql3);
				conn.execute(sql3, function(err3, res3){
					if(err3){
						console.log('에러 80번줄');
					}else{
						console.log('sql3성공 = '+ res3.rowAffected);
						sql4 = "select * from roomoto where creator = '"+sender+"' and receiver = '"+receiver+"' and rownum<=1 order by roomcode desc"
						console.log("sql4 = "+sql4);
						conn.execute(sql4, function(err4, res4){
							if(err4){
								console.log("err4오류");
							}else{
								console.log('err4성공')
								console.log("sql4로 들어옴 " + res4.rows[0][0]);
								roomcode = res4.rows[0][0];
								sql = "select otonum, ordernum, productnum, receiver, sender, to_char(otodate, 'YYYY/MM/DD HH:MI:SS') as otodate, otocontent, "+
								" (select min(otonum) from oto where (receiver='tester' and sender='qwer') or (receiver='qwer' and sender='tester')) as code "+
								" from oto where ((receiver = '"+sender+"' and sender = '"+receiver+"') or (sender='"+sender+"' and receiver = '"+receiver+"')) and roomcode="+ roomcode+" order by otonum"
								conn.execute(sql, function(error, result){
									if(error){
										res.writeHead(200, {"Content-type":"text/html;charset=utf-8"});
										res.write("<script>");
										res.write("alert('error_code : 001')");
										res.end("</script>");
									}else{
										fs.readFile(__dirname+"\\chatForm.ejs",'utf-8', function(error, data){
											if(error){
												res.writeHead(200, {"Content-type":"text/html;charset=utf-8"});
												res.write("<script>");
												res.write("alert('error_code : 002');");
												res.end("</script>");
											}else{
												var totalRecord = result.rows.length;
												res.writeHead(200, {"Content-type":"text/html;charset=utf-8"});
												res.end(ejs.render(data, {
													results : result,
													totalRecord : totalRecord,
													sender:sender,
													receiver : receiver,
													roomcode : roomcode
												}))
											}
										})
									}
								});// sql.execute
							}
						})
					}
				})
			}
		}
	});
})

var socketio = require('socket.io');
var io = socketio.listen(server);
io.sockets.on('connection', function(socket){
	console.log('클라이언트가 접속함...');
	// 상대방 이름의 방
	var roomcode;
	socket.on('join', function(data){
		console.log("생성된 방 코드 : "+data);
		roomcode = data;
		socket.join(roomcode);
		console.log(roomcode+"으로 연결");
	});
	
	socket.on('message', function(msg){
		console.log(msg);
		var sender = msg.split("|")[0];
		var receiver = msg.split("|")[1];
		var message = msg.split("|")[2];
		var roomcode = msg.split("|")[3];
		var returnmsg = "";
		// 같은 방에 있는 접속자에게 받은 메세지 보내기
		console.log("sender="+sender+", receiver=" + receiver + ", message="+message);
		sql = "insert into oto(otonum, ordernum, productnum, receiver, sender, otodate, otocontent, roomcode)"
			  + " values(otosq.nextval, null, null,'"+ receiver + "', '"+ sender +"', sysdate, '"+message+"', '"+roomcode+"')";
		console.log("삽입문="+sql);
		conn.execute(sql, function(error, result){
			if(error){
				console.log("실패.. chat.js에서 발생\n "+error);
			}else{
				console.log('성공 => ' + result);
			}
		})
		
		io.sockets.in(roomcode).emit('response', msg);
		
	});
});

server.listen(12021, function(){
	console.log('서버 시작..              http://192.168.0.47:12021/chatForm?sender=qwer&receiver=qwerqwer&roomcode=5');
})