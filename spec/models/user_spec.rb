require 'spec_helper'

describe User do
  describe "validations" do
    context "when everything is good" do
      Given(:user) { User.make }
      Then { user.should be_valid_model }
    end

    context "when password is given" do
      Given(:user) { User.make(password: "secret", password_confirmation: "secret") }
      Then { user.should be_valid_model }
    end

    context "when name is missing" do
      Given(:user) { User.make(name: nil) }
      Then { user.should be_invalid_on(:name, message: /blank/) }
    end

    context "when email is missing" do
      Given(:user) { User.make(email: nil) }
      Then { user.should be_invalid_on(:email, message: /blank/) }
    end

    context "when email is not unique" do
      Given(:email) { "a@x.com" }
      Given!(:preexisting_user) { User.make(email: email).in_db }
      Given(:duplicate_user) { User.make(email: email) }
      Then { duplicate_user.should be_invalid_on(:email, message: /already.*taken/) }
    end

    context "when email is malformed" do
      Given(:user) { User.make(email: "no_at_sign_in_email") }
      Then { user.should be_invalid_on(:email, message: /invalid/) }
    end

    context "when password confirmation is incorrect" do
      Given(:user) { User.make(password: "secret", password_confirmation: "") }
      Then { user.should be_invalid_on(:password, message: /confirmation/) }
    end

    context "when password is too short" do
      Given(:password) { '123' }
      Given(:user) { User.make(password: password, password_confirmation: password) }
      Then { user.should be_invalid_on(:password, message: /too short/) }
    end
  end

  context "when saving" do
    before { pending }
    context "with passwords" do
      Given(:user) { User.make(password: "secret", password_confirmation: "secret") }
      When(:save_result) { user.save }
      Then { save_result.should be_true }
      Then { user.password_digest.should_not be_blank }
    end

    context "without passwords" do
      Given { User.delete_all }
      Given(:name) { "ebenezer" }
      Given(:original_user) { User.make(name: name, password: "secret", password_confirmation: "secret").in_db }
      Given(:reloaded_user) { User.find_by_name(name) }
      Then { reloaded_user.should be_valid_model }
      Then { reloaded_user.password_digest.should == original_user.password_digest }
    end
  end
end
