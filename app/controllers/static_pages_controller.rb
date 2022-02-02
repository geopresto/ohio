class StaticPagesController < ApplicationController

    def home
        render html: "Welcome"
    end
end