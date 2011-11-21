%% Author: ishii0514
%% Created: 2011/11/15
%% Description: TODO: Add description to node_test1
-module(node_test1).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([add/2,print/1]).

%%
%% API Functions
%%

add(X,Y) ->
	X+ Y.
print(X) ->
	io:format("out: ~p~n",[X]).

%%
%% Local Functions
%%

