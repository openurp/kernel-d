/*
 * OpenURP, Open University Resourse Planning Program
 *
 * Copyright (c) 2013-2014, OpenURP Software.
 *
 * OpenURP is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * OpenURP is distributed in the hope that it will be useful.
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with OpenURP.  If not, see <http://www.gnu.org/licenses/>.
 */
module openurp.base.time.model;

import std.datetime;
import std.conv;
import std.string;
import std.exception;
import beangle.commons.entity.entity;
import openurp.base.org.model;
/**
 * 教学日历方案
 * 校历（日历方案）记录了一整套学年学期的设置，是连贯性学年学期设置的集合，也可称日历方案。
 */
interface Calendar :Entity!uint,Updated,TemporalAt,Named{
    @property Semester[] semesters();
    @property School school();
}

/**
 * 学年学期 </p> 代表的是具体学年度的 学期设置，每个学期的起始日期（起始日期要以星期日作为第一天）和结束日期。
 */
interface Semester:Entity!uint,Coded,Named,TemporalOn{
    /**日历*/
    @property Calendar calendar();
    /**学年度,一般为yyyy-yyyy或者yyyy的格式*/
    @property string schoolYear();
    /**开始日期*/
    @property Date beginOn();
    /**结束日期*/
    @property Date endOn();
    /**对应开始年份的开始周*/
    @property int startWeek();
}

interface SemesterStage:Entity!uint,Named{
    @property Semester semester();
    @property uint beginWeek();
    @property uint endWeek();
}
/**
 * 假日安排
 */
interface Holiday:Entity!uint,Named,TemporalOn{
    @property School school();
}

/**
 * 时间设置
 */
interface TimeSetting :Entity!uint,Named{
    @property School school();
    @property CourseUnit[ushort] units(); 
}

interface CourseUnit:Entity!uint,Named{
    @property string indexno();
    @property DayTime beginTime();
    @property DayTime endTime();
}

/**
 * 一天中的时间，格式如45:33
 */
struct DayTime{
    ushort value;
    this(string time){
        auto index = indexOf(time,':');
        enforce(index==2 && time.length==5,"illegal time,it should with 00:00 format");
        enforce((to!ushort(time[0 .. index])<60 && to!ushort(time[index + 1 .. index + 3])<60),
            "illegal time " ~ time ~ ",it should within 60:60.");
        value= to!ushort(time[0 .. index] ~ time[index + 1 .. index + 3]);
    }
    
    string  toString() {
        auto time = to!string(value);
        if(value>=6000) throw new ConvException("Invalid time "~time);
        while(time.length<4) time="0" ~ time;
        return time[0..2]~":"~time[2..4];
    }
}

unittest{
    import std.stdio;
    auto t = DayTime();
    assert(t.toString()=="00:00");
    
    auto t2=DayTime("54:34");
    assert(t2.value==5434);
    assert(t2.toString()=="54:34");
    
    assertThrown(DayTime("69:34"),"69:34 not a valid day time format.");
}

enum Weekday : ubyte { sun = 0,mon,tue,wed,thu,fri,sat}

unittest{
    assert(Weekday.mon==1);
}

struct WeekState{
    long value;
    this(string str){
        value=to!long(str,2);
    }
    
    string toString(){
        return "";
    }
    
    @property ubyte count(){
        return 0;
    }
    
    @property ubyte[] weeks(){
        return [1];
    }
}

unittest{
    import std.stdio;
    writeln(WeekState("10101").value);
}