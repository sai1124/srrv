package com.srr.upvc.utils;

public class UnitMeasure {

	public static final double mm_feet = 0.0032808;
	
	public static double mm_to_feet_round(double mm_length) {
		double len_feet = mm_length * mm_feet;
		System.out.println(len_feet);
		System.out.println(len_feet - Math.floor(len_feet));
		if ((len_feet - Math.floor(len_feet)) < 0.5 && len_feet >0) {
			len_feet = Math.floor(len_feet) + 0.5;
		} else {
			len_feet = Math.ceil(len_feet);
		}
		return len_feet;
	}
}
