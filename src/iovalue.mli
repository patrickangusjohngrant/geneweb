(* $Id: iovalue.mli,v 3.3 2001-03-07 03:13:15 ddr Exp $ *)
(* Copyright (c) 2001 INRIA *)

value input : in_channel -> 'a;
value input_int : in_channel -> int;
value output : out_channel -> 'a -> unit;

value size : 'a -> int;
value digest : 'a -> Digest.t;

value sizeof_long : int;

(* generic functions *)

type in_funs 'a =
  { input_byte : 'a -> int;
    input_binary_int : 'a -> int;
    input : 'a -> string -> int -> int -> unit }
;
value gen_input : in_funs 'a -> 'a -> 'b;
value in_channel_funs : in_funs in_channel;

type out_funs 'a =
  { output_byte : 'a -> int -> unit;
    output_binary_int : 'a -> int -> unit;
    output : 'a -> string -> int -> int -> unit }
;
value gen_output : out_funs 'a -> 'a -> 'b -> unit;
value out_channel_funs : out_funs out_channel;
