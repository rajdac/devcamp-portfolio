ARG APP_BASE_IMAGE

FROM $APP_BASE_IMAGE

ARG APP_NAME


# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.

run mkdir -p /opt/${APP_NAME}
COPY Gemfile /opt/${APP_NAME}/Gemfile
COPY Gemfile.lock /opt/${APP_NAME}/Gemfile.lock
WORKDIR /opt/${APP_NAME}
COPY . /opt/${APP_NAME}/
RUN chown -R msuser1:msuser1 /opt/${APP_NAME}

COPY docker/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ADD docker/start.sh /usr/local/sbin/start
RUN chmod +x /usr/local/sbin/start

#started each time container is started
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000


CMD ["/usr/local/sbin/start"]
