%% Author: ishii0514
%% Created: 2011/11/15
%% Description: TODO: Add description to node_test2
-module(node_test2).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([start1/0,start2/0,loop/0]).
-export([call_add1/2,call_add2/3]).

%%
%% API Functions
%%

start1() ->
	spawn(?MODULE,loop,[]).

start2() ->
	register(server,spawn(?MODULE,loop,[])).


call_add1(X,Y) ->
	server ! {self(),add,{X,Y}},
	receive
		Reply ->
			Reply
	after
		3000 ->
			io:format("timeout~n",[])
	end.
call_add2(Node,X,Y) ->
	{server,Node} ! {self(),add,{X,Y}},
	receive
		Reply ->
			Reply
	after
		3000 ->
			io:format("timeoute~n",[])
	end.
			
loop() ->
	receive
		{From,add,{X,Y}} ->
			From ! (X+Y);
		Other ->
			io:format("receive: ~p~n",[Other]),
			exit(receive_unexpected_message)
	end,
	loop().


%%
%% Local Functions
%%

