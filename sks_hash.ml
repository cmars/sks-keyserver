
let cin = new Channel.sys_in_channel stdin
let cout = new Channel.sys_out_channel stdout

let () =
  let next = Key.next_of_channel cin in
  let rec loop () =
    match next () with
        None -> ()
      | Some key ->
		Printf.fprintf stdout "%s\n" (KeyHash.hexify (KeyHash.hash (Fixkey.canonicalize key))); loop()
  in
  loop ()

