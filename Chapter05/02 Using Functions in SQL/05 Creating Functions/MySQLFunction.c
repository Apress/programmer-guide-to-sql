#include <string>

#include <my_global.h>
#include <my_sys.h>
#include <mysql.h>

using namespace std;

char* FormatName(UDF_INIT *initid, UDF_ARGS *args,
                 char *result, unsigned long *length,
                 char *is_null, char *error)
{
   // Retrieve the Name parameter from the args parameter
   char* fullName = new char[args->lengths[0]];
   fullName = args->args[0];

   // Convert from char* to string
   string strName = fullName;

   // Trim whitespace from end of string
   int i = strName.length();
   while (strName[i] == ' ' || strName[i] == '\0') i--;
   string trimName = strName.substr(0, i + 1);

   // Arrange in 'LastName, FirstName' format
   int spaceIndex = trimName.find_first_of(" ");
   string firstName = trimName.substr(0, spaceIndex);
   string lastName = trimName.substr(spaceIndex + 1);
   string formattedName = lastName + ", " + firstName;

   // Convert back to char* and set the length argument
   char* fmtName = new char[];
   formattedName.copy(result, string::npos);
   *length = static_cast<unsigned long>(i + 2);

   return result;
}
