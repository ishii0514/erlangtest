%% Author: ishii0514
%% Created: 2011/11/22
%% Description: TODO: Add description to call_back2
-module(call_back2).

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
	io:format("PRINT ~p~n",[Request]).



%%
%% Local Functions
%%

