describe 'The application' do

  it "should render the home page" do
    get('/home')
    expect(last_response).to be_ok
    expect(last_response.body).to include('Welcome to the home page!')
  end

  it "should render the about page" do
    get('/about')
    expect(last_response).to be_ok
    expect(last_response.body).to include('Welcome to the about page!')
  end

end
