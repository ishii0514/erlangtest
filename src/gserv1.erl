%% Author: ishii0514
%% Created: 2011/11/22
%% Description: TODO: Add description to gserv1
-module(gserv1).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([start/0]).
-export([command/1]).
-export([init/1,handle_call/3,handle_cast/2]).

%%
%% API Functions
%%
start() ->
	gen_server:start_link({local,l_server},?MODULE,[],[]).




%%
%% Local Functions
%%

