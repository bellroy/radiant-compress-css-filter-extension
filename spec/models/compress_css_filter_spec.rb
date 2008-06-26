require File.dirname(__FILE__) + '/../spec_helper'

describe CompressCssFilter do 

    before do
       @csv = CompressCssFilter.new
    end

    it "should have filter name as 'CompressCss'" do
       CompressCssFilter.filter_name.should == 'CompressCss'
    end
  
    it "should remove the spaces" do
       @csv.filter('p.first{ color: blue; }').should == "p.first{color:blue;}"
    end

    it "should remove the comments" do
       @csv.filter("/* a comment */ p.first{ color: blue; }").should == "p.first{color:blue;}"
    end

    it "should collapse the newlines" do
       @csv.filter("\n\n p.first{ color: blue; }").should == "\np.first{color:blue;}"
    end

    it "should remove the extra spaces around brackets and also must add a newline just after the }" do
       @csv.filter(".a_class  { color: #000 } #an_id { color: #aaa}").should == ".a_class{color:#000}\n#an_id{color:#aaa}"
    end

    it "should remove the last break" do
       @csv.filter("p.first{ color: blue; }\n").should == "p.first{color:blue;}"
    end

    it "should remove spaces, collapse newlines, remove comments, remove last break and add a newline just after the }" do
       @csv.filter("/* a comment */\n\n\n  .a_class  { color: #000 }\n\n#an_id { color: #aaa}\n").should == ".a_class{color:#000}\n#an_id{color:#aaa}"
    end
end
