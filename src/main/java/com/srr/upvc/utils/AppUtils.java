package com.srr.upvc.utils;

import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import com.fasterxml.jackson.databind.MappingIterator;
import com.fasterxml.jackson.dataformat.csv.CsvMapper;
import com.fasterxml.jackson.dataformat.csv.CsvSchema;

public class AppUtils {

	public static Date convertDate(String inputDate) {
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);

		String dateInString = inputDate;
		Date date = new Date();
		try {
			date = formatter.parse(dateInString);
			System.out.println(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}

	public static String covertDateToString(Date inputDate) {
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);
		String date = "";

		date = formatter.format(inputDate);

		return date;
	}

	public static <T> List<T> loadUtitles(Class<T> type, InputStream file) throws IOException {
		CsvSchema csv = CsvSchema.emptySchema().withHeader();
		CsvMapper mapper = new CsvMapper();
		MappingIterator<T> readValues = mapper.readerFor(type).with(csv).readValues(file);
		return readValues.readAll();
	}
}
