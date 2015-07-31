require 'rails_helper'

describe Vote do
  describe "validations" do
    describe "value validation" do
      # before do
      #   @post = Post.create(title: 'post title', body: 'post body')
      # end

      # it "only allows -1 or 1 as values" do
      #   expect(@post.value).to eq(1 || -1)
      # end

      invalid_vote = !(votes.where(value: 1 || value: -1))

      it "only allows -1 or 1 as values" do
        expect(invalid_vote.valid?).to eq(false)
      end
    end
  end
end