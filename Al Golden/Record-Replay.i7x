Version 3 of Record-Replay by Al Golden begins here.

"This is now a stand-alone extension where it was originally part of the Debugging extension. It does not
work on any compiler prior to 6L02."

use authorial modesty.

Include (- 
Verb meta 'recording' *          -> CommandsOn 
                                  * 'on'   -> CommandsOn 
                                  * 'off'  -> CommandsOff;

Verb meta 'replay'     *       -> CommandsRead;

#ifdef TARGET_ZCODE;

[ CommandsOnSub;
    @output_stream 4;
    xcommsdir = 1;
    "[Command recording on.]^^";
];

[ CommandsOffSub;
    if (xcommsdir == 1) @output_stream -4;
    xcommsdir = 0;
    "[Command recording off.] ^^";
];

[ CommandsReadSub;
    @input_stream 1;
    xcommsdir = 2;
    "[Replaying commands.]^^";
];

#ifnot; ! TARGET_GLULX

[ CommandsOnSub fref;
    if (gg_commandstr ~= 0) {
        if (gg_command_reading) "[Commands are currently replaying.]";
        else "[Command recording already on.]";
    }
    ! fileref_create_by_prompt
    fref = glk($0062, $103, $01, 0);
    if (fref == 0) "[Command recording failed.]";
    gg_command_reading = false;
    ! stream_open_file
    gg_commandstr = glk($0042, fref, $01, GG_COMMANDWSTR_ROCK);
    glk($0063, fref); ! fileref_destroy
    if (gg_commandstr == 0) return 4;
    "[Command recording on.]^^ ";
];

[ CommandsOffSub;
    if (gg_commandstr == 0) "[Command recording is already off.]";
    if (gg_command_reading) "[Command replay complete.]";
    glk($0044, gg_commandstr, 0); ! stream_close
    gg_commandstr = 0;
    gg_command_reading = false;
    "[Command recording off.]";
];

[ CommandsReadSub fref;
    if (gg_commandstr ~= 0) {
        if (gg_command_reading) "[Commands are already replaying.]";
        else "[Command replay failed.  Command recording is on.]";
    }
    ! fileref_create_by_prompt
    fref = glk($0062, $103, $02, 0);
    if (fref == 0) "[Command replay failed.]";
    gg_command_reading = true;
    ! stream_open_file
    gg_commandstr = glk($0042, fref, $02, GG_COMMANDRSTR_ROCK);
    glk($0063, fref); ! fileref_destroy
    if (gg_commandstr == 0) return 4;
    "[Command replay complete.]";
];

#endif; ! TARGET_

 -).

	
Record-Replay ends here.

---- DOCUMENTATION ----

Since the recording/replay functions of Inform 6 are not currently handled by Inform 7, 
this short extension allows those 2 functions.

This code was originally included in the "Debugging" extension
which is now a stand-alone extension.

Typing "RECORDING" or "RECORDING ON" starts a transcript.

Typing "RECORDING OFF" terminates said transcript.

Typing "REPLAY" brings up a dialog box and allows you to replay what you've
recorded.

