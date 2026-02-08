**free
  //------------------------------------------------------------------------------------------------
  // PROGRAM:          CONSULTATION
  // CREATION:         YYYY.MM.DD - CGONCALVES
  // CHANGE:           YYYY.MM.DD - CGONCALVES
  // ROLE:             Search for a type description
  //------------------------------------------------------------------------------------------------
  //------------------------------------------------------------------------------------------------
  // PARAMETERS
  //------------------------------------------------------------------------------------------------
  DCL-PI *n;
  // Receives
    wktipo char(1);                                                             // Type
  // Returns
    wadesc char(10);                                                            // Description
  END-PI;
  //------------------------------------------------------------------------------------------------
  // PROGRAM FLOW
  //------------------------------------------------------------------------------------------------
  // Start of the program
  exsr $start;
  // Searches within the type descriptions table
  exsr cntitdesc;
  // End of the program
  exsr $end;
  //------------------------------------------------------------------------------------------------
  // SEARCH for elements in file CGTITDESC
  //------------------------------------------------------------------------------------------------
  begsr cntitdesc;
    exec sql
  // attributes the value found description to the entry variable
      select cgtddesc into :wadesc
      from cgtitdesc
  // searches for the record with the same type as the one received (wktipo)
      where cgtdtipo = :wktipo;
  endsr;
  //------------------------------------------------------------------------------------------------
  // RELATIVE START OF THE PROGRAM
  //------------------------------------------------------------------------------------------------
  begsr $start;
  // Clears the entry parameter associated with the field
    wadesc = *blanks;
  endsr;
  //------------------------------------------------------------------------------------------------
  // END OF THE PROGRAM
  //------------------------------------------------------------------------------------------------
  begsr $end;
    return;
  endsr;
  //------------------------------------------------------------------------------------------------
  // ABSOLUTE START OF THE PROGRAM
  //------------------------------------------------------------------------------------------------
  begsr *inzsr;
  endsr;
