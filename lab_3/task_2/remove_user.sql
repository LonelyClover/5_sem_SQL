REASSIGN OWNED BY view_test TO lonely_clover;
REVOKE ALL ON TABLE port FROM view_test;
REVOKE ALL ON TABLE ship FROM view_test;
REVOKE ALL ON TABLE visit FROM view_test;
DROP ROLE view_test;
REASSIGN OWNED BY recent_visit_role TO lonely_clover;
REVOKE ALL ON TABLE port FROM recent_visit_role;
REVOKE ALL ON TABLE ship FROM recent_visit_role;
REVOKE ALL ON TABLE visit FROM recent_visit_role;
DROP ROLE recent_visit_role;
REASSIGN OWNED BY test TO lonely_clover;
REVOKE ALL ON TABLE port FROM test;
REVOKE ALL ON TABLE ship FROM test;
REVOKE ALL ON TABLE visit FROM test;
DROP ROLE test;
