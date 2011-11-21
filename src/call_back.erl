%% Author: ishii0514
%% Created: 2011/11/21
%% Description: TODO: Add description to call_back
-module(call_back).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([handle_call/1]).

%%
%% API Functions
%%

handle_call(Request) ->
	io:format("print~p~n",[Request]).


%%
%% Local Functions
%%

