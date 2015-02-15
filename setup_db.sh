#! /bin/bash

rake db:create;
rake db:migrate;
rake assets:precompile;
