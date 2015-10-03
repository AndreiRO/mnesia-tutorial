-module(test).

-include_lib("stdlib/include/qlc.hrl").
-include("records.hrl").
-export([init/0, insert/1, create_pers/3]).

init() ->
	mnesia:create_table(
							persoana,
							[{
								attributes,
								record_info(fields, persoana)
							}]
						),
	mnesia:create_table(
							masina,
							[{
								attributes,
								record_info(fields, masina)
							}]
						).

insert(Stuff) ->
	Fun = fun() ->
			mnesia:write(Stuff)
		  end,
	mnesia:transaction(Fun).

create_pers(Nume, Prenume, Cnp) ->
	#persoana{
		nume = Nume,
		prenume = Prenume,
		cnp = Cnp
	}.