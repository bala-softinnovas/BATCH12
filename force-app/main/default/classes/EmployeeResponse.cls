public with sharing class EmployeeResponse {
    public Integer error;
    public String msg;
    public List<EmployeeWrapper> data;

    public class EmployeeWrapper {
        public Integer id;
        public String username;
        public String name;
        public String email;
        public String gender;
        public String designation;
        public String phone_number;
        public String complete_address;
    }
}
