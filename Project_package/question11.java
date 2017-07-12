// ORM class for table 'question11'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Tue Jul 11 03:32:35 PDT 2017
// For connector: org.apache.sqoop.manager.MySQLManager
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.mapred.lib.db.DBWritable;
import com.cloudera.sqoop.lib.JdbcWritableBridge;
import com.cloudera.sqoop.lib.DelimiterSet;
import com.cloudera.sqoop.lib.FieldFormatter;
import com.cloudera.sqoop.lib.RecordParser;
import com.cloudera.sqoop.lib.BooleanParser;
import com.cloudera.sqoop.lib.BlobRef;
import com.cloudera.sqoop.lib.ClobRef;
import com.cloudera.sqoop.lib.LargeObjectLoader;
import com.cloudera.sqoop.lib.SqoopRecord;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class question11 extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  protected ResultSet __cur_result_set;
  private String job_title;
  public String get_job_title() {
    return job_title;
  }
  public void set_job_title(String job_title) {
    this.job_title = job_title;
  }
  public question11 with_job_title(String job_title) {
    this.job_title = job_title;
    return this;
  }
  private Integer petitions;
  public Integer get_petitions() {
    return petitions;
  }
  public void set_petitions(Integer petitions) {
    this.petitions = petitions;
  }
  public question11 with_petitions(Integer petitions) {
    this.petitions = petitions;
    return this;
  }
  private Float success_rate;
  public Float get_success_rate() {
    return success_rate;
  }
  public void set_success_rate(Float success_rate) {
    this.success_rate = success_rate;
  }
  public question11 with_success_rate(Float success_rate) {
    this.success_rate = success_rate;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof question11)) {
      return false;
    }
    question11 that = (question11) o;
    boolean equal = true;
    equal = equal && (this.job_title == null ? that.job_title == null : this.job_title.equals(that.job_title));
    equal = equal && (this.petitions == null ? that.petitions == null : this.petitions.equals(that.petitions));
    equal = equal && (this.success_rate == null ? that.success_rate == null : this.success_rate.equals(that.success_rate));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof question11)) {
      return false;
    }
    question11 that = (question11) o;
    boolean equal = true;
    equal = equal && (this.job_title == null ? that.job_title == null : this.job_title.equals(that.job_title));
    equal = equal && (this.petitions == null ? that.petitions == null : this.petitions.equals(that.petitions));
    equal = equal && (this.success_rate == null ? that.success_rate == null : this.success_rate.equals(that.success_rate));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.job_title = JdbcWritableBridge.readString(1, __dbResults);
    this.petitions = JdbcWritableBridge.readInteger(2, __dbResults);
    this.success_rate = JdbcWritableBridge.readFloat(3, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.job_title = JdbcWritableBridge.readString(1, __dbResults);
    this.petitions = JdbcWritableBridge.readInteger(2, __dbResults);
    this.success_rate = JdbcWritableBridge.readFloat(3, __dbResults);
  }
  public void loadLargeObjects(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void loadLargeObjects0(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void write(PreparedStatement __dbStmt) throws SQLException {
    write(__dbStmt, 0);
  }

  public int write(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(job_title, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(petitions, 2 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeFloat(success_rate, 3 + __off, 7, __dbStmt);
    return 3;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(job_title, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(petitions, 2 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeFloat(success_rate, 3 + __off, 7, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.job_title = null;
    } else {
    this.job_title = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.petitions = null;
    } else {
    this.petitions = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.success_rate = null;
    } else {
    this.success_rate = Float.valueOf(__dataIn.readFloat());
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.job_title) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, job_title);
    }
    if (null == this.petitions) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.petitions);
    }
    if (null == this.success_rate) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeFloat(this.success_rate);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.job_title) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, job_title);
    }
    if (null == this.petitions) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.petitions);
    }
    if (null == this.success_rate) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeFloat(this.success_rate);
    }
  }
  private static final DelimiterSet __outputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  public String toString() {
    return toString(__outputDelimiters, true);
  }
  public String toString(DelimiterSet delimiters) {
    return toString(delimiters, true);
  }
  public String toString(boolean useRecordDelim) {
    return toString(__outputDelimiters, useRecordDelim);
  }
  public String toString(DelimiterSet delimiters, boolean useRecordDelim) {
    StringBuilder __sb = new StringBuilder();
    char fieldDelim = delimiters.getFieldsTerminatedBy();
    __sb.append(FieldFormatter.escapeAndEnclose(job_title==null?"null":job_title, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(petitions==null?"null":"" + petitions, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(success_rate==null?"null":"" + success_rate, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(job_title==null?"null":job_title, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(petitions==null?"null":"" + petitions, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(success_rate==null?"null":"" + success_rate, delimiters));
  }
  private static final DelimiterSet __inputDelimiters = new DelimiterSet((char) 34, (char) 10, (char) 0, (char) 0, false);
  private RecordParser __parser;
  public void parse(Text __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharSequence __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(byte [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(char [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(ByteBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  private void __loadFromFields(List<String> fields) {
    Iterator<String> __it = fields.listIterator();
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.job_title = null; } else {
      this.job_title = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.petitions = null; } else {
      this.petitions = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.success_rate = null; } else {
      this.success_rate = Float.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.job_title = null; } else {
      this.job_title = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.petitions = null; } else {
      this.petitions = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.success_rate = null; } else {
      this.success_rate = Float.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    question11 o = (question11) super.clone();
    return o;
  }

  public void clone0(question11 o) throws CloneNotSupportedException {
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new TreeMap<String, Object>();
    __sqoop$field_map.put("job_title", this.job_title);
    __sqoop$field_map.put("petitions", this.petitions);
    __sqoop$field_map.put("success_rate", this.success_rate);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("job_title", this.job_title);
    __sqoop$field_map.put("petitions", this.petitions);
    __sqoop$field_map.put("success_rate", this.success_rate);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if ("job_title".equals(__fieldName)) {
      this.job_title = (String) __fieldVal;
    }
    else    if ("petitions".equals(__fieldName)) {
      this.petitions = (Integer) __fieldVal;
    }
    else    if ("success_rate".equals(__fieldName)) {
      this.success_rate = (Float) __fieldVal;
    }
    else {
      throw new RuntimeException("No such field: " + __fieldName);
    }
  }
  public boolean setField0(String __fieldName, Object __fieldVal) {
    if ("job_title".equals(__fieldName)) {
      this.job_title = (String) __fieldVal;
      return true;
    }
    else    if ("petitions".equals(__fieldName)) {
      this.petitions = (Integer) __fieldVal;
      return true;
    }
    else    if ("success_rate".equals(__fieldName)) {
      this.success_rate = (Float) __fieldVal;
      return true;
    }
    else {
      return false;    }
  }
}
