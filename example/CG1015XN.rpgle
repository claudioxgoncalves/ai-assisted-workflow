      *---------------------------------------------------------------------------------------------
      * PROGRAM:          CONSULTATION
      * CREATION:         YYYY.MM.DD - CGONCALVES
      * CHANGE:           YYYY.MM.DD - CGONCALVES
      * ROLE:             Search for a type description
      *---------------------------------------------------------------------------------------------

      *---------------------------------------------------------------------------------------------
      * FILES
      *---------------------------------------------------------------------------------------------
     Fcgtitdesc1if   e           k disk
      *---------------------------------------------------------------------------------------------
      * STAND ALONE FIELDS
      *---------------------------------------------------------------------------------------------
     D wadesc          s             10A                                        Description
     D wktipo          s              1A                                        Type
      *---------------------------------------------------------------------------------------------
      * PARAMETERS
      *---------------------------------------------------------------------------------------------
     C     *entry        plist
     C* Receives
     C                   parm                    wktipo                         Type
     C* Returns
     C                   parm                    wadesc                         Description
      *---------------------------------------------------------------------------------------------
      * PROGRAM FLOW
      *---------------------------------------------------------------------------------------------
     C* Start of the program
     C                   exsr      $start
     C* Searches within the type descriptions table
     C                   exsr      cntitdesc
     C* End of the program
     C                   exsr      $end
      *---------------------------------------------------------------------------------------------
      * SEARCH for elements in file CGTITDESC
      *---------------------------------------------------------------------------------------------
     C     cntitdesc     begsr
     C* Searches for the record with the same type as the one received (wktipo)
     C     wktipo        chain     rtitdesc1
     C* If a record was found...
     C                   if        %found                                       if
     C* attributes the value found description to the entry variable            |
     C                   eval      wadesc = cgtddesc                            |
     C                   endif                                                  end
     C                   endsr
      *---------------------------------------------------------------------------------------------
      * RELATIVE START OF THE PROGRAM
      *---------------------------------------------------------------------------------------------
     C     $start        begsr
     C* Clears the entry parameter associated with the field
     C                   eval      wadesc = *blanks
     C                   endsr
      *---------------------------------------------------------------------------------------------
      * END OF THE PROGRAM
      *---------------------------------------------------------------------------------------------
     C     $end          begsr
     C                   return
     C                   endsr
      *---------------------------------------------------------------------------------------------
      * ABSOLUTE START OF THE PROGRAM
      *---------------------------------------------------------------------------------------------
     C     *inzsr        begsr
     C                   endsr