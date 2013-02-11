require 'spec_helper'

describe "CommentPages" do
  let(:user) { FactoryGirl.create(:user) }
  let(:post) { FactoryGirl.create(:post, user: user) }
  subject { page }

  context "with user signed in" do

    before { sign_in(user) }

    describe "Creating a new Comment" do
      before { visit new_post_comment_url}
      context "with form properly filled out" do
        before do
          fill_in :body, with: "hey, this comment agrees with the post"
        end
        it "should create a new comment for the referring post" do
          expect{ click_button(:submit) }.to change(Comment, :count).by(1)
        end
      end
    end
  end
end
