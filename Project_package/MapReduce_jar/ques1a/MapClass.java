package ques1a;

import java.io.IOException;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class MapClass extends Mapper<LongWritable,Text,Text,LongWritable>{

LongWritable one =new LongWritable(1); 
public void map(LongWritable key,Text values,Context context) throws IOException, InterruptedException
{  	
 if(key.get()> 0)
 	{
	 String [] column = values.toString().split("\\t"); 
	
	 if(column[4]!=null && column[4].equalsIgnoreCase("DATA ENGINEER") && column[7]!=null && !column[7].equals("NA"))
		{	
			Text combiner = new Text(column[4]+","+column[7]);
	  		context.write(combiner,one);
		}
	}
}
}