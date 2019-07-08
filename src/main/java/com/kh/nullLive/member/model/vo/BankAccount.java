package com.kh.nullLive.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BankAccount {
	//TABLE : BANK_ACCOUNT
	private int accno;			//ACCNO
	private int bankCode;		//BANK_CODE
	private String bankAccount;	//BANK_ACCOUNT
	private String holder;		//HOLDER
	private String bankStatus;	//BANK_STATUS
	private int mno;			//MNO
}
