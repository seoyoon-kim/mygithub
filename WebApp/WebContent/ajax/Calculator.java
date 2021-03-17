package swingTest;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class Calculator extends JPanel implements ActionListener {
	// Font ����
	Font fnt = new Font("Arial",Font.BOLD, 20);
	
	//JFrame - north
	JTextField resultTf = new JTextField("0.0");
	
	//JFrame - center
	JPanel centerPane = new JPanel(new BorderLayout()); // FlowLayout -> BorderLayout
		JPanel northPane = new JPanel(new GridLayout(1,3));
		JPanel btnPane = new JPanel(new GridLayout(4,4));
		
	String btnLbl[] = {"Backspace","Clear","End","7","8","9","+","4","5","6","-","1","2","3","*","0",".","=","/"};

	//������ ���� ����
	String operator ="";
	//�ǿ����� ����
	double result = 0.0;
	
	
	public Calculator() {
		//���̾ƿ��� �÷ο� ���̾ƿ� -> �������̾ƿ����� ����
		setLayout(new BorderLayout());
//		super("����");// ������ ����
		//JFrame - north
		add("North",resultTf);
		resultTf.setFont(fnt);
		//		SwingConstants.RIGHT ����
		//		resultTf.setHorizontalAlignment(4)   constant field values
		resultTf.setHorizontalAlignment(JTextField.RIGHT);
		
		//JFrame - center
		add("Center",centerPane);
		centerPane.add("North", northPane);
		centerPane.add(BorderLayout.CENTER,btnPane);
		
		
		//��ư ����
		for(int i = 0; i<btnLbl.length; i++) {
			JButton btn = new JButton(btnLbl[i]);
			btn.setFont(fnt);// �۲� ���� ũ��
			if(i<3) {
				northPane.add(btn);
			} else {
				btnPane.add(btn);
				btn.setBackground(Color.LIGHT_GRAY);
			}
			// �̺�Ʈ ���
			btn.addActionListener(this);
		}
		
//		setSize(400,250);// ������ ����
//		setVisible(true);// â�� �����ش�
//		setDefaultCloseOperation(DISPOSE_ON_CLOSE); // ȭ�鲨��
	}
	
	@Override
	public void actionPerformed(ActionEvent ae) {
		String eventBtn = ae.getActionCommand();
		System.out.println(eventBtn);
		
		switch(eventBtn) {
		case "End" : System.exit(0);break;
		
		case "0" : case "1": case "2": case"3":
		case"4":case"5":case"6":
		case"7":case"8":case"9": setNumber(eventBtn); break;
		case".":setPoint(eventBtn);break;
		case "Backspace" : setBackspace(); break;
		case "+":case"-":case"/":case"*": setOperator(eventBtn); break;
		case "=":setResult(); break;
		case "Clear" : setClear();
		}
	}
	//������ �ʱ�ȭ
	public void setClear() {
		result = 0.0;
		operator = "";
		resultTf.setText("0.0");
	}
	
	// �����ϱ�
	public void setResult() {
		double secondNum = Double.parseDouble(resultTf.getText());
		switch(operator) {
		case "+" : result = result + secondNum; break;
		case "-" : result = result - secondNum; break;
		case "*" : result = result * secondNum; break;
		case "/" : result = result / secondNum; break;
		}
		resultTf.setText(String.valueOf(result));
		operator = "";
	}
	
	// ������ ó��
	public void setOperator(String operator) {
		//������ ����
		this.operator = operator;
		result = Double.parseDouble(resultTf.getText());//���� ����
		resultTf.setText("");
		
	}
	
	//�齺���̽� ó��
	public void setBackspace() {
		String lblStr = resultTf.getText(); // 12345678
		String cutStr = lblStr.substring(0, lblStr.length()-1);
		resultTf.setText(cutStr);
	}
	
	//���� ó��
	public void setNumber(String num) {
		//JTextField �� ���� �� ������
		String lblStr = resultTf.getText(); // 0.0
		if(lblStr.equals("0.0")) {
			resultTf.setText(num); // Ŭ���� ���� ��ư�� ����
		} else {
			resultTf.setText(lblStr+num);
		}
	}
	
	//�Ҽ��� ó��
	public void setPoint(String a) {
		String lblStr = resultTf.getText();
		int idx = lblStr.indexOf(".");
		if(idx == -1) {
			resultTf.setText(lblStr+".");
		}
	}
	
	
//	public static void main(String[] args) {
//		new Calculator();
//	}
	
	
}
