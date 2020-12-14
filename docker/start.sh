#!/bin/sh

export set BUNDLE_GEMFILE=Gemfile
export set GEM_HOME=/usr/local/bundle

echo "------------#{$RAILS_ENV}----------------------"
if ! gem list bundler -i ; then
    echo "-------bundler ver in start.sh-----#{$BUNDLER_VERSION}----------------------"
    gem install bundler -v $BUNDLER_VERSION \
    && bundle config --global path "$GEM_HOME" \
    && bundle config --global bin "$GEM_HOME/bin"
fi

export set BUNDLE_APP_CONFIG=$GEM_HOME

cd /opt/${APP_NAME}

if [ $RUN_MODE = 'new' ]
then
    bundle install
    echo "Creating new rails app.......# {$APP_NAME}................"
    rails new . --force --database=postgresql --skip-bundle
else
    if [ $RUN_MODE = 'rebuild' ]
    then
        echo "Bundle install started...................."
        bundle install

       if [ $RAILS_VERSION = '4' ]
       then 
            echo "Cleaning precompiled assets started...................."
            bin/rails assets:clean

            echo "Assets precompile started...................."
            bin/rails assets:precompile
       fi

        echo "migration started...................."
        #rake db:migrate
    fi

    if [ $APP_MODE = "web" ]
    then   
        if [ $RAILS_ENV = 'development' ]
        then
            echo "Running Rails...................."
            rails s -p 3000 -b '0.0.0.0'
        else
            echo "About to perform Jubilee Start"
            cp /opt/${APP_NAME}/docker/supervisor-web.conf /etc/supervisor/conf.d/web.conf
        fi
    fi
fi