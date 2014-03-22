class OwnersController < ApplicationController

before_filter :authenticate_owner!

def dashboard
end

end
