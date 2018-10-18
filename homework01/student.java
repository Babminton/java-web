/**
 * 
 */
package com.sise.myservlet;

import java.io.Serializable;

/**
  @author zeng
  @date 2018年10月15日 下午10:23:59
  @Descripton
 */
public class student implements Serializable {
      int sno;
      String sname;
      int chinese;
      int math;
      int english;
      public student() {
  		super();
  	}
   student(int sno,String sname,int chinese,int math,int english){
	  this.sno=sno;
	  this.sname=sname;
	  this.chinese=chinese;
	  this.math=math;
	  this.english=english;
	  
  }
	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public int getChinese() {
		return chinese;
	}

	public void setChinese(int chinese) {
		this.chinese = chinese;
	}

	public int getMath() {
		return math;
	}

	public void setMath(int math) {
		this.math = math;
	}

	public int getEnglish() {
		return english;
	}

	public void setEnglish(int english) {
		this.english = english;
	}
      
      
      
}
