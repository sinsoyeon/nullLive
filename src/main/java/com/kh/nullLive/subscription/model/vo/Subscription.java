package com.kh.nullLive.subscription.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @author uukk
 * @comment : 구독 vo
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Subscription {
	private int suno;
	private int mno;
	private int sno;
	private Date suStartDate;
	private Date suPeriodDate;
	private String suStatus;
}
