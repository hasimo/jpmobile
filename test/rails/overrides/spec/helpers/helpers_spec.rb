# -*- coding: utf-8 -*-
require File.expand_path(File.join(File.dirname(__FILE__), '/../spec_helper'))

describe Jpmobile::Helpers do
  include Jpmobile::Helpers
  it "docomo_guid_link_to が guid=ON を付けたリンクを生成すること" do
    docomo_guid_link_to("STRING", :controller => "filter", :action => "rawdata").should == %{<a href="/filter/rawdata?guid=ON">STRING</a>}
  end
  it "docomo_guid_link_toがstrをhtml_safeかチェックし 自動的にhtml要素をエスケープする" do
    docomo_guid_link_to("<>&", :controller => "filter", :action => "rawdata").should == %{<a href="/filter/rawdata?guid=ON">&lt;&gt;&amp;</a>}
    docomo_guid_link_to("<>&".html_safe, :controller => "filter", :action => "rawdata").should == %{<a href="/filter/rawdata?guid=ON"><>&</a>}
  end
  it "softbank_location_link_to がリンク先にパラメータを含んでいても正常に動作すること" do
    # http://d.hatena.ne.jp/mizincogrammer/20090123/1232702067
    softbank_location_link_to("STRING", :controller => "filter", :action => "rawdata", :p => "param").should == %{<a href="location:auto?url=http://test.host/filter/rawdata&amp;p=param">STRING</a>}
  end
end
