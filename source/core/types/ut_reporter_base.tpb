create or replace type body ut_reporter_base is
  /*
  utPLSQL - Version 3
  Copyright 2016 - 2017 utPLSQL Project

  Licensed under the Apache License, Version 2.0 (the "License"):
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
  */

  final member procedure init(self in out nocopy ut_reporter_base, a_self_type varchar2) is
  begin
    self.self_type   := a_self_type;
    self.reporter_id := sys_guid();
    self.start_date  := sysdate();
    return;
  end;

  member procedure print_text(self in out nocopy ut_reporter_base, a_text varchar2) is
  begin
    ut_output_buffer.send_line(self,a_text);
  end;

  member procedure print_clob(self in out nocopy ut_reporter_base, a_clob clob) is
    l_lines ut_varchar2_list;
  begin
    if a_clob is not null and dbms_lob.getlength(a_clob) > 0 then
      l_lines := ut_utils.clob_to_table(a_clob);
      for i in 1 .. l_lines.count loop
        self.print_text(l_lines(i));
      end loop;
    end if;
  end;

  -- run hooks
  member procedure before_calling_run(self in out nocopy ut_reporter_base, a_run in ut_run) is
  begin
    null;
  end;

  -- suite hooks
  member procedure before_calling_suite(self in out nocopy ut_reporter_base, a_suite in ut_logical_suite) is
  begin
    null;
  end;

  member procedure before_calling_before_all(self in out nocopy ut_reporter_base, a_suite in ut_logical_suite) is
  begin
    null;
  end;
  member procedure after_calling_before_all (self in out nocopy ut_reporter_base, a_suite in ut_logical_suite) is
  begin
    null;
  end;

  member procedure before_calling_before_each(self in out nocopy ut_reporter_base, a_suite in ut_test) is
  begin
    null;
  end;
  member procedure after_calling_before_each (self in out nocopy ut_reporter_base, a_suite in ut_test) is
  begin
    null;
  end;

  -- test hooks
  member procedure before_calling_test(self in out nocopy ut_reporter_base, a_test in ut_test) is
  begin
    null;
  end;

  member procedure before_calling_before_test(self in out nocopy ut_reporter_base, a_test in ut_test) is
  begin
    null;
  end;
  member procedure after_calling_before_test (self in out nocopy ut_reporter_base, a_test in ut_test) is
  begin
    null;
  end;

  member procedure before_calling_test_execute(self in out nocopy ut_reporter_base, a_test in ut_test) is
  begin
    null;
  end;
  member procedure after_calling_test_execute (self in out nocopy ut_reporter_base, a_test in ut_test) is
  begin
    null;
  end;

  member procedure before_calling_after_test(self in out nocopy ut_reporter_base, a_test in ut_test) is
  begin
    null;
  end;
  member procedure after_calling_after_test (self in out nocopy ut_reporter_base, a_test in ut_test) is
  begin
    null;
  end;

  member procedure after_calling_test(self in out nocopy ut_reporter_base, a_test in ut_test) is
  begin
    null;
  end;

  --suite hooks continued
  member procedure before_calling_after_each(self in out nocopy ut_reporter_base, a_suite in ut_test) is
  begin
    null;
  end;
  member procedure after_calling_after_each (self in out nocopy ut_reporter_base, a_suite in ut_test) is
  begin
    null;
  end;

  member procedure before_calling_after_all(self in out nocopy ut_reporter_base, a_suite in ut_logical_suite) is
  begin
    null;
  end;
  member procedure after_calling_after_all (self in out nocopy ut_reporter_base, a_suite in ut_logical_suite) is
  begin
    null;
  end;

  member procedure after_calling_suite(self in out nocopy ut_reporter_base, a_suite in ut_logical_suite) is
  begin
    null;
  end;

  -- run hooks continued
  member procedure after_calling_run (self in out nocopy ut_reporter_base, a_run in ut_run) is
  begin
    ut_output_buffer.close(self);
  end;

end;
/
