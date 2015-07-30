describe Vote do
  describe "validations" do
    describe "value validation" do
      before do
        @post = Post.create(title: 'post title', body: 'post body')
      end

      it "only allows -1 or 1 as values" do
        expect(@post.value).to eq(1 || -1)
      end
    end
  end
end