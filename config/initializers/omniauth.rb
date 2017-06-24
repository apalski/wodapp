
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '0baa007762dc36d143ea', 'bf581cc5dc724d2a4302cc36e5132b2749e76ccb'
end