class DBname{
//database name
static const String dbname='Yoddha.db';

///table name
static const String shaid='Shaid';
static const String shaidFamily='ShaidFamily';
static const String shaidChildren='ShaidChildren';
static const String user='User';

static const List<String> tableNames=[shaid,shaidFamily,shaidChildren,user];


//common files
static const String id='id';
static const String shaidId='shaid_id';
static const String name = 'name';
static const String relation = 'relation';
static const String occupation = 'occupation';
static const String financialStatus = 'financial_status';
static const String createdAt = 'created_at';
static const String updatedAt = 'updated_at';


///Shaid
static const String gender = 'gender';
static const String state = 'state';
static const String district = 'district';
static const String ward = 'ward';
static const String tole = 'tole';
static const String image = 'image';
static const String deathdate = 'death_date';
static const String deathplace = 'death_place';
static const String responsible = 'responsible';

///table
static const String shaidTableCreate="""CREATE TABLE $shaid(
        $id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        gender TEXT,
        state TEXT,
        district TEXT,
        ward TEXT,
        tole TEXT,
        image TEXT,
        death_date DATETIME,
        death_place TEXT,
        created_at DATETIME,
        updated_at DATEtIME
        )""";


///shaid children
static const String dob = 'dob';
static const String educationQualification = 'education_qualification';
static const String currentlyStudyingLevel = 'currently_studying_level';
static const String faculty = 'faculty';

///table
static const String shaidChildrenTableCreate="""CREATE TABLE $shaidChildren(
        $id INTEGER PRIMARY KEY AUTOINCREMENT,
        sahid_id INT,
        name TEXT,
        relation TEXT,
        dob DATETIME,
        education_qualification TEXT,
        currently_studying_level TEXT,
        faculty TEXT,
        occupation TEXT,
        financial_status TEXT,
        created_at DATETIME,
        updated_at DATETIME
        )""";

///shaid family
static const String age = 'age';
static const String remarks = 'remarks';

/// Table
static const String shaidFamilyTableCreate="""CREATE TABLE $shaidFamily(
        $id INTEGER PRIMARY KEY AUTOINCREMENT,
        sahid_id INT,
        name TEXT,
        relation TEXT,
        age INT,
        occupation TEXT,
        financial_status TEXT,
        remarks TEXT,
        created_at DATETIME,
        updated_at DATETIME
        )""";

}