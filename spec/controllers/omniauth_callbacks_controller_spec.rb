require 'spec_helper'

describe CrowdintAuth::OmniauthCallbacksController do
  describe "#user_class" do
    before do
      @klass = Class.new
      Object.const_set 'User', @klass
    end

    it "returns the User class" do
      subject.user_class.should be @klass
    end
  end

  describe "#create_user_record" do
    let(:user_class) do
      stub
    end

    it "creates the user record" do
      subject.stub(:user_class).and_return user_class
      user_class.should_receive(:create).with(:email => 'test@example.com', :name => 'Test User')
      subject.create_user_record('test@example.com', 'Test User')
    end
  end

  describe "#google_apps" do
    before do
      @auth_hash = stub(:info => { "email" => "test@example.com", "name" => "Test User" })
      @request = stub(:env => { "omniauth.auth" => @auth_hash })

      @user, @user_class = stub, stub

      subject.stub(:request).and_return @request
      subject.stub(:user_class).and_return @user_class

      @user = stub
      @user.stub(:persisted?).and_return true
    end

    context "User exists" do
      it "signs in the user" do
        @user_class.should_receive(:find_by_email).with("test@example.com").
          and_return @user
      end
    end

    context "User does not exist" do
      it "creates and signs in the user" do
        @user_class.should_receive(:find_by_email).with("test@example.com").
          and_return nil

        subject.should_receive(:create_user_record).with("test@example.com", "Test User").
          and_return @user
      end
    end

    after do
      subject.should_receive(:sign_in_and_redirect).with(@user)
      subject.google_apps
    end
  end

  describe "#google_apps_sign_in" do
    it "redirects to the google apps signin page" do
      redirect_path = stub
      subject.should_receive(:user_omniauth_authorize_path).with(:google_apps).
          and_return redirect_path
      subject.should_receive(:redirect_to).with(redirect_path)
      subject.google_apps_sign_in
    end
  end
end
