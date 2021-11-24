Time formats
------------

Invalid time

  $ okra lint << EOF
  > # Title
  > 
  > - This is a KR (KR123)
  >   - @eng1 (1 day), eng2 (2 days)
  >   - My work
  > EOF
  [ERROR(S)]: <stdin>
  
  In KR "@eng1 (1 day), eng2 (2 days)":
    Invalid time entry found. Format is '- @eng1 (x days), @eng2 (x days)'
  [1]
  $ okra lint << EOF
  > # Title
  > 
  > - This is a KR (KR123)
  >   - @eng1 (1 day); @eng2 (2 days)
  >   - My work
  > EOF
  [ERROR(S)]: <stdin>
  
  In KR "@eng1 (1 day); @eng2 (2 days)":
    Invalid time entry found. Format is '- @eng1 (x days), @eng2 (x days)'
  [1]
  $ okra lint << EOF
  > # Title
  > 
  > - This is a KR (KR123)
  >   - @eng1 (1 day) @eng2 (2 days)
  >   - My work
  > EOF
  [ERROR(S)]: <stdin>
  
  In KR "@eng1 (1 day) @eng2 (2 days)":
    Invalid time entry found. Format is '- @eng1 (x days), @eng2 (x days)'
  [1]

Valid time

  $ okra lint << EOF
  > # Title
  > 
  > - This is a KR (KR123)
  >   - @eng1 (.5 day)
  >   - My work
  > 
  > - This is a KR (KR124)
  >   - @eng1 (.5 days)
  >   - My work
  > 
  > - This is a KR (KR124)
  >   - @eng1 (0.5 days)
  >   - My work
  > 
  > - This is a KR (KR124)
  >   - @eng1 (0.5 day)
  >   - My work
  > 
  > - This is a KR (KR124)
  >   - @eng1 (0.1 days), @eng1 (.5 day)
  >   - My work
  > EOF
  [OK]: <stdin>
