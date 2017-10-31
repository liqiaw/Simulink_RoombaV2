function RoombaClose
persistent obj
coder.extrinsic('evalin');
coder.extrinsic('get');
if isempty(obj)
    obj = evalin('base','objWs');
end
fwrite(obj,7); %reset opcode
fwrite(obj,173); %stop opcode
fclose(obj);
%delete(obj);