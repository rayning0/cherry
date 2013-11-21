describe RandomStuffController do
  describe "GET text" do
    it "returns a text formatted response" do
      get :text

      response.body.should == "simple text"
    end
  end

  describe "GET nothing" do
    it "returns nothing" do
      get "nothing"

      response.body.blank?.should == true
    end
  end

  describe "get classified page" do
    it "should return a status of 401 if not passed a token" do
      get :classified

      assert_response(401)
    end

    it "should return a status of 200 given a token" do
      get :classified, token: '123456'

      assert_response(200)
    end
  end

  describe "GET zig" do
    it "should redirect to zag" do
      get "zig"

      response.should redirect_to '/zag'
    end
  end
end
