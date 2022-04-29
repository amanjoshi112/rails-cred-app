require 'rails_helper'

describe ArticlesController, :type => :controller do
  context "GET #index" do
    before do
      get :index
    end

    it "responds successfully with an HTTP 200 status code" do
      #expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "assigns @articles" do
      article = Article.create(title: "Ipl 2022", body: "IPl 2022 is started")
      expect(response).to have_http_status(200)
      get :index
      expect(assigns(:articles)).to eq([article])
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do 
    it "returns a article using token" do 
      @article= Article.create(title: "Ipl 2022", body: "IPl 2022 is started")
      @token= @article.id
      get :show, params:{ id: @token}
      expect(response.status).to eq(200)
    end
  end

  describe '#create' do
    it 'should pass when article is successfully created' do
      Article.create(title: "Ipl 2022", body: "IPl 2022 is started")
      expect(response).to have_http_status(200)
    end
  end

  describe "GET articles#new" do
    it "should render articles#new template" do
    end
  end

  describe "GET articles#edit" do
    it "should render articles#edit template" do
      @article = Article.all
      @token= @article.ids
      get :edit, params:{ id: @token}
      expect(response.status).to eq(200)
    end
  end
end
