
opts = {scope: 'user:email'}

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '0baa007762dc36d143ea', 'cc7c00fcc98d5c199e6141d01ae9045a578f53b5', opts
end