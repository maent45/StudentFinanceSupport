﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.34209
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;



[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="StudentFinancialServices")]
public partial class StudentFinancialServicesDataClassesDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  partial void InsertLoginDetail(LoginDetail instance);
  partial void UpdateLoginDetail(LoginDetail instance);
  partial void DeleteLoginDetail(LoginDetail instance);
  partial void InsertStudentRegistration(StudentRegistration instance);
  partial void UpdateStudentRegistration(StudentRegistration instance);
  partial void DeleteStudentRegistration(StudentRegistration instance);
  partial void InsertStudentVoucher(StudentVoucher instance);
  partial void UpdateStudentVoucher(StudentVoucher instance);
  partial void DeleteStudentVoucher(StudentVoucher instance);
  partial void InsertFacultyType(FacultyType instance);
  partial void UpdateFacultyType(FacultyType instance);
  partial void DeleteFacultyType(FacultyType instance);
  partial void InsertGrantType(GrantType instance);
  partial void UpdateGrantType(GrantType instance);
  partial void DeleteGrantType(GrantType instance);
  partial void InsertCourseType(CourseType instance);
  partial void UpdateCourseType(CourseType instance);
  partial void DeleteCourseType(CourseType instance);
  #endregion
	
	public StudentFinancialServicesDataClassesDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["StudentFinancialServicesConnectionString"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public StudentFinancialServicesDataClassesDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public StudentFinancialServicesDataClassesDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public StudentFinancialServicesDataClassesDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public StudentFinancialServicesDataClassesDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<LoginDetail> LoginDetails
	{
		get
		{
			return this.GetTable<LoginDetail>();
		}
	}
	
	public System.Data.Linq.Table<StudentRegistration> StudentRegistrations
	{
		get
		{
			return this.GetTable<StudentRegistration>();
		}
	}
	
	public System.Data.Linq.Table<StudentVoucher> StudentVouchers
	{
		get
		{
			return this.GetTable<StudentVoucher>();
		}
	}
	
	public System.Data.Linq.Table<FacultyType> FacultyTypes
	{
		get
		{
			return this.GetTable<FacultyType>();
		}
	}
	
	public System.Data.Linq.Table<GrantType> GrantTypes
	{
		get
		{
			return this.GetTable<GrantType>();
		}
	}
	
	public System.Data.Linq.Table<CourseType> CourseTypes
	{
		get
		{
			return this.GetTable<CourseType>();
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.LoginDetails")]
public partial class LoginDetail : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private string _Login_Id;
	
	private string _Login_Password;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnLogin_IdChanging(string value);
    partial void OnLogin_IdChanged();
    partial void OnLogin_PasswordChanging(string value);
    partial void OnLogin_PasswordChanged();
    #endregion
	
	public LoginDetail()
	{
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Login_Id", DbType="NVarChar(10) NOT NULL", CanBeNull=false, IsPrimaryKey=true)]
	public string Login_Id
	{
		get
		{
			return this._Login_Id;
		}
		set
		{
			if ((this._Login_Id != value))
			{
				this.OnLogin_IdChanging(value);
				this.SendPropertyChanging();
				this._Login_Id = value;
				this.SendPropertyChanged("Login_Id");
				this.OnLogin_IdChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Login_Password", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
	public string Login_Password
	{
		get
		{
			return this._Login_Password;
		}
		set
		{
			if ((this._Login_Password != value))
			{
				this.OnLogin_PasswordChanging(value);
				this.SendPropertyChanging();
				this._Login_Password = value;
				this.SendPropertyChanged("Login_Password");
				this.OnLogin_PasswordChanged();
			}
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.StudentRegistration")]
public partial class StudentRegistration : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private string _Student_Id;
	
	private string _Student_FirstName;
	
	private string _Student_LastName;
	
	private string _Student_Gender;
	
	private System.DateTime _Student_DateOfBirth;
	
	private string _Student_Address1;
	
	private string _Student_Accomodation_Type;
	
	private string _Student_Phone;
	
	private string _Student_Mobile;
	
	private string _Student_Email;
	
	private string _Student_Marital_Status;
	
	private string _Student_Contact;
	
	private string _Student_Main_Ethnicity;
	
	private string _Student_Faculty;
	
	private string _Student_Courses;
	
	private string _Student_Detailed_Ethnicity;
	
	private string _Student_Campus;
	
	private EntitySet<StudentVoucher> _StudentVouchers;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnStudent_IdChanging(string value);
    partial void OnStudent_IdChanged();
    partial void OnStudent_FirstNameChanging(string value);
    partial void OnStudent_FirstNameChanged();
    partial void OnStudent_LastNameChanging(string value);
    partial void OnStudent_LastNameChanged();
    partial void OnStudent_GenderChanging(string value);
    partial void OnStudent_GenderChanged();
    partial void OnStudent_DateOfBirthChanging(System.DateTime value);
    partial void OnStudent_DateOfBirthChanged();
    partial void OnStudent_Address1Changing(string value);
    partial void OnStudent_Address1Changed();
    partial void OnStudent_Accomodation_TypeChanging(string value);
    partial void OnStudent_Accomodation_TypeChanged();
    partial void OnStudent_PhoneChanging(string value);
    partial void OnStudent_PhoneChanged();
    partial void OnStudent_MobileChanging(string value);
    partial void OnStudent_MobileChanged();
    partial void OnStudent_EmailChanging(string value);
    partial void OnStudent_EmailChanged();
    partial void OnStudent_Marital_StatusChanging(string value);
    partial void OnStudent_Marital_StatusChanged();
    partial void OnStudent_ContactChanging(string value);
    partial void OnStudent_ContactChanged();
    partial void OnStudent_Main_EthnicityChanging(string value);
    partial void OnStudent_Main_EthnicityChanged();
    partial void OnStudent_FacultyChanging(string value);
    partial void OnStudent_FacultyChanged();
    partial void OnStudent_CoursesChanging(string value);
    partial void OnStudent_CoursesChanged();
    partial void OnStudent_Detailed_EthnicityChanging(string value);
    partial void OnStudent_Detailed_EthnicityChanged();
    partial void OnStudent_CampusChanging(string value);
    partial void OnStudent_CampusChanged();
    #endregion
	
	public StudentRegistration()
	{
		this._StudentVouchers = new EntitySet<StudentVoucher>(new Action<StudentVoucher>(this.attach_StudentVouchers), new Action<StudentVoucher>(this.detach_StudentVouchers));
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Student_Id", DbType="NVarChar(10) NOT NULL", CanBeNull=false, IsPrimaryKey=true)]
	public string Student_Id
	{
		get
		{
			return this._Student_Id;
		}
		set
		{
			if ((this._Student_Id != value))
			{
				this.OnStudent_IdChanging(value);
				this.SendPropertyChanging();
				this._Student_Id = value;
				this.SendPropertyChanged("Student_Id");
				this.OnStudent_IdChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Student_FirstName", DbType="NVarChar(120) NOT NULL", CanBeNull=false)]
	public string Student_FirstName
	{
		get
		{
			return this._Student_FirstName;
		}
		set
		{
			if ((this._Student_FirstName != value))
			{
				this.OnStudent_FirstNameChanging(value);
				this.SendPropertyChanging();
				this._Student_FirstName = value;
				this.SendPropertyChanged("Student_FirstName");
				this.OnStudent_FirstNameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Student_LastName", DbType="NVarChar(120)")]
	public string Student_LastName
	{
		get
		{
			return this._Student_LastName;
		}
		set
		{
			if ((this._Student_LastName != value))
			{
				this.OnStudent_LastNameChanging(value);
				this.SendPropertyChanging();
				this._Student_LastName = value;
				this.SendPropertyChanged("Student_LastName");
				this.OnStudent_LastNameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Student_Gender", DbType="NVarChar(6) NOT NULL", CanBeNull=false)]
	public string Student_Gender
	{
		get
		{
			return this._Student_Gender;
		}
		set
		{
			if ((this._Student_Gender != value))
			{
				this.OnStudent_GenderChanging(value);
				this.SendPropertyChanging();
				this._Student_Gender = value;
				this.SendPropertyChanged("Student_Gender");
				this.OnStudent_GenderChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Student_DateOfBirth", DbType="Date NOT NULL")]
	public System.DateTime Student_DateOfBirth
	{
		get
		{
			return this._Student_DateOfBirth;
		}
		set
		{
			if ((this._Student_DateOfBirth != value))
			{
				this.OnStudent_DateOfBirthChanging(value);
				this.SendPropertyChanging();
				this._Student_DateOfBirth = value;
				this.SendPropertyChanged("Student_DateOfBirth");
				this.OnStudent_DateOfBirthChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Student_Address1", DbType="NVarChar(50)")]
	public string Student_Address1
	{
		get
		{
			return this._Student_Address1;
		}
		set
		{
			if ((this._Student_Address1 != value))
			{
				this.OnStudent_Address1Changing(value);
				this.SendPropertyChanging();
				this._Student_Address1 = value;
				this.SendPropertyChanged("Student_Address1");
				this.OnStudent_Address1Changed();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Student_Accomodation_Type", DbType="NVarChar(70)")]
	public string Student_Accomodation_Type
	{
		get
		{
			return this._Student_Accomodation_Type;
		}
		set
		{
			if ((this._Student_Accomodation_Type != value))
			{
				this.OnStudent_Accomodation_TypeChanging(value);
				this.SendPropertyChanging();
				this._Student_Accomodation_Type = value;
				this.SendPropertyChanged("Student_Accomodation_Type");
				this.OnStudent_Accomodation_TypeChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Student_Phone", DbType="NVarChar(50)")]
	public string Student_Phone
	{
		get
		{
			return this._Student_Phone;
		}
		set
		{
			if ((this._Student_Phone != value))
			{
				this.OnStudent_PhoneChanging(value);
				this.SendPropertyChanging();
				this._Student_Phone = value;
				this.SendPropertyChanged("Student_Phone");
				this.OnStudent_PhoneChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Student_Mobile", DbType="NVarChar(50)")]
	public string Student_Mobile
	{
		get
		{
			return this._Student_Mobile;
		}
		set
		{
			if ((this._Student_Mobile != value))
			{
				this.OnStudent_MobileChanging(value);
				this.SendPropertyChanging();
				this._Student_Mobile = value;
				this.SendPropertyChanged("Student_Mobile");
				this.OnStudent_MobileChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Student_Email", DbType="NVarChar(50)")]
	public string Student_Email
	{
		get
		{
			return this._Student_Email;
		}
		set
		{
			if ((this._Student_Email != value))
			{
				this.OnStudent_EmailChanging(value);
				this.SendPropertyChanging();
				this._Student_Email = value;
				this.SendPropertyChanged("Student_Email");
				this.OnStudent_EmailChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Student_Marital_Status", DbType="NVarChar(50)")]
	public string Student_Marital_Status
	{
		get
		{
			return this._Student_Marital_Status;
		}
		set
		{
			if ((this._Student_Marital_Status != value))
			{
				this.OnStudent_Marital_StatusChanging(value);
				this.SendPropertyChanging();
				this._Student_Marital_Status = value;
				this.SendPropertyChanged("Student_Marital_Status");
				this.OnStudent_Marital_StatusChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Student_Contact", DbType="NVarChar(50)")]
	public string Student_Contact
	{
		get
		{
			return this._Student_Contact;
		}
		set
		{
			if ((this._Student_Contact != value))
			{
				this.OnStudent_ContactChanging(value);
				this.SendPropertyChanging();
				this._Student_Contact = value;
				this.SendPropertyChanged("Student_Contact");
				this.OnStudent_ContactChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Student_Main_Ethnicity", DbType="NVarChar(50)")]
	public string Student_Main_Ethnicity
	{
		get
		{
			return this._Student_Main_Ethnicity;
		}
		set
		{
			if ((this._Student_Main_Ethnicity != value))
			{
				this.OnStudent_Main_EthnicityChanging(value);
				this.SendPropertyChanging();
				this._Student_Main_Ethnicity = value;
				this.SendPropertyChanged("Student_Main_Ethnicity");
				this.OnStudent_Main_EthnicityChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Student_Faculty", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
	public string Student_Faculty
	{
		get
		{
			return this._Student_Faculty;
		}
		set
		{
			if ((this._Student_Faculty != value))
			{
				this.OnStudent_FacultyChanging(value);
				this.SendPropertyChanging();
				this._Student_Faculty = value;
				this.SendPropertyChanged("Student_Faculty");
				this.OnStudent_FacultyChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Student_Courses", DbType="NVarChar(50)")]
	public string Student_Courses
	{
		get
		{
			return this._Student_Courses;
		}
		set
		{
			if ((this._Student_Courses != value))
			{
				this.OnStudent_CoursesChanging(value);
				this.SendPropertyChanging();
				this._Student_Courses = value;
				this.SendPropertyChanged("Student_Courses");
				this.OnStudent_CoursesChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Student_Detailed_Ethnicity", DbType="NVarChar(50)")]
	public string Student_Detailed_Ethnicity
	{
		get
		{
			return this._Student_Detailed_Ethnicity;
		}
		set
		{
			if ((this._Student_Detailed_Ethnicity != value))
			{
				this.OnStudent_Detailed_EthnicityChanging(value);
				this.SendPropertyChanging();
				this._Student_Detailed_Ethnicity = value;
				this.SendPropertyChanged("Student_Detailed_Ethnicity");
				this.OnStudent_Detailed_EthnicityChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Student_Campus", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
	public string Student_Campus
	{
		get
		{
			return this._Student_Campus;
		}
		set
		{
			if ((this._Student_Campus != value))
			{
				this.OnStudent_CampusChanging(value);
				this.SendPropertyChanging();
				this._Student_Campus = value;
				this.SendPropertyChanged("Student_Campus");
				this.OnStudent_CampusChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.AssociationAttribute(Name="StudentRegistration_StudentVoucher", Storage="_StudentVouchers", ThisKey="Student_Id", OtherKey="Student_Id")]
	public EntitySet<StudentVoucher> StudentVouchers
	{
		get
		{
			return this._StudentVouchers;
		}
		set
		{
			this._StudentVouchers.Assign(value);
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
	
	private void attach_StudentVouchers(StudentVoucher entity)
	{
		this.SendPropertyChanging();
		entity.StudentRegistration = this;
	}
	
	private void detach_StudentVouchers(StudentVoucher entity)
	{
		this.SendPropertyChanging();
		entity.StudentRegistration = null;
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.StudentVouchers")]
public partial class StudentVoucher : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private string _Student_Id;
	
	private string _Grant_Type;
	
	private string _Grant_Description;
	
	private System.Nullable<decimal> _Grant_Value;
	
	private System.Nullable<System.DateTime> _Date_Of_Issue;
	
	private System.Nullable<decimal> _KohaFunds;
	
	private int _Ref_No;
	
	private EntityRef<StudentRegistration> _StudentRegistration;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnStudent_IdChanging(string value);
    partial void OnStudent_IdChanged();
    partial void OnGrant_TypeChanging(string value);
    partial void OnGrant_TypeChanged();
    partial void OnGrant_DescriptionChanging(string value);
    partial void OnGrant_DescriptionChanged();
    partial void OnGrant_ValueChanging(System.Nullable<decimal> value);
    partial void OnGrant_ValueChanged();
    partial void OnDate_Of_IssueChanging(System.Nullable<System.DateTime> value);
    partial void OnDate_Of_IssueChanged();
    partial void OnKohaFundsChanging(System.Nullable<decimal> value);
    partial void OnKohaFundsChanged();
    partial void OnRef_NoChanging(int value);
    partial void OnRef_NoChanged();
    #endregion
	
	public StudentVoucher()
	{
		this._StudentRegistration = default(EntityRef<StudentRegistration>);
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Student_Id", DbType="NVarChar(10) NOT NULL", CanBeNull=false)]
	public string Student_Id
	{
		get
		{
			return this._Student_Id;
		}
		set
		{
			if ((this._Student_Id != value))
			{
				if (this._StudentRegistration.HasLoadedOrAssignedValue)
				{
					throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
				}
				this.OnStudent_IdChanging(value);
				this.SendPropertyChanging();
				this._Student_Id = value;
				this.SendPropertyChanged("Student_Id");
				this.OnStudent_IdChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Grant_Type", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
	public string Grant_Type
	{
		get
		{
			return this._Grant_Type;
		}
		set
		{
			if ((this._Grant_Type != value))
			{
				this.OnGrant_TypeChanging(value);
				this.SendPropertyChanging();
				this._Grant_Type = value;
				this.SendPropertyChanged("Grant_Type");
				this.OnGrant_TypeChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Grant_Description", DbType="NVarChar(MAX)")]
	public string Grant_Description
	{
		get
		{
			return this._Grant_Description;
		}
		set
		{
			if ((this._Grant_Description != value))
			{
				this.OnGrant_DescriptionChanging(value);
				this.SendPropertyChanging();
				this._Grant_Description = value;
				this.SendPropertyChanged("Grant_Description");
				this.OnGrant_DescriptionChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Grant_Value", DbType="Money")]
	public System.Nullable<decimal> Grant_Value
	{
		get
		{
			return this._Grant_Value;
		}
		set
		{
			if ((this._Grant_Value != value))
			{
				this.OnGrant_ValueChanging(value);
				this.SendPropertyChanging();
				this._Grant_Value = value;
				this.SendPropertyChanged("Grant_Value");
				this.OnGrant_ValueChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Date_Of_Issue", DbType="Date")]
	public System.Nullable<System.DateTime> Date_Of_Issue
	{
		get
		{
			return this._Date_Of_Issue;
		}
		set
		{
			if ((this._Date_Of_Issue != value))
			{
				this.OnDate_Of_IssueChanging(value);
				this.SendPropertyChanging();
				this._Date_Of_Issue = value;
				this.SendPropertyChanged("Date_Of_Issue");
				this.OnDate_Of_IssueChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_KohaFunds", DbType="Money")]
	public System.Nullable<decimal> KohaFunds
	{
		get
		{
			return this._KohaFunds;
		}
		set
		{
			if ((this._KohaFunds != value))
			{
				this.OnKohaFundsChanging(value);
				this.SendPropertyChanging();
				this._KohaFunds = value;
				this.SendPropertyChanged("KohaFunds");
				this.OnKohaFundsChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Ref_No", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int Ref_No
	{
		get
		{
			return this._Ref_No;
		}
		set
		{
			if ((this._Ref_No != value))
			{
				this.OnRef_NoChanging(value);
				this.SendPropertyChanging();
				this._Ref_No = value;
				this.SendPropertyChanged("Ref_No");
				this.OnRef_NoChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.AssociationAttribute(Name="StudentRegistration_StudentVoucher", Storage="_StudentRegistration", ThisKey="Student_Id", OtherKey="Student_Id", IsForeignKey=true)]
	public StudentRegistration StudentRegistration
	{
		get
		{
			return this._StudentRegistration.Entity;
		}
		set
		{
			StudentRegistration previousValue = this._StudentRegistration.Entity;
			if (((previousValue != value) 
						|| (this._StudentRegistration.HasLoadedOrAssignedValue == false)))
			{
				this.SendPropertyChanging();
				if ((previousValue != null))
				{
					this._StudentRegistration.Entity = null;
					previousValue.StudentVouchers.Remove(this);
				}
				this._StudentRegistration.Entity = value;
				if ((value != null))
				{
					value.StudentVouchers.Add(this);
					this._Student_Id = value.Student_Id;
				}
				else
				{
					this._Student_Id = default(string);
				}
				this.SendPropertyChanged("StudentRegistration");
			}
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.FacultyTypes")]
public partial class FacultyType : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _Faculty_Id;
	
	private string _Faculty_Name;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnFaculty_IdChanging(int value);
    partial void OnFaculty_IdChanged();
    partial void OnFaculty_NameChanging(string value);
    partial void OnFaculty_NameChanged();
    #endregion
	
	public FacultyType()
	{
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Faculty_Id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int Faculty_Id
	{
		get
		{
			return this._Faculty_Id;
		}
		set
		{
			if ((this._Faculty_Id != value))
			{
				this.OnFaculty_IdChanging(value);
				this.SendPropertyChanging();
				this._Faculty_Id = value;
				this.SendPropertyChanged("Faculty_Id");
				this.OnFaculty_IdChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Faculty_Name", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
	public string Faculty_Name
	{
		get
		{
			return this._Faculty_Name;
		}
		set
		{
			if ((this._Faculty_Name != value))
			{
				this.OnFaculty_NameChanging(value);
				this.SendPropertyChanging();
				this._Faculty_Name = value;
				this.SendPropertyChanged("Faculty_Name");
				this.OnFaculty_NameChanged();
			}
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.GrantTypes")]
public partial class GrantType : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _Grant_Id;
	
	private string _Grant_Name;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnGrant_IdChanging(int value);
    partial void OnGrant_IdChanged();
    partial void OnGrant_NameChanging(string value);
    partial void OnGrant_NameChanged();
    #endregion
	
	public GrantType()
	{
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Grant_Id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int Grant_Id
	{
		get
		{
			return this._Grant_Id;
		}
		set
		{
			if ((this._Grant_Id != value))
			{
				this.OnGrant_IdChanging(value);
				this.SendPropertyChanging();
				this._Grant_Id = value;
				this.SendPropertyChanged("Grant_Id");
				this.OnGrant_IdChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Grant_Name", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
	public string Grant_Name
	{
		get
		{
			return this._Grant_Name;
		}
		set
		{
			if ((this._Grant_Name != value))
			{
				this.OnGrant_NameChanging(value);
				this.SendPropertyChanging();
				this._Grant_Name = value;
				this.SendPropertyChanged("Grant_Name");
				this.OnGrant_NameChanged();
			}
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.CourseTypes")]
public partial class CourseType : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _Course_Id;
	
	private string _Course_Name;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnCourse_IdChanging(int value);
    partial void OnCourse_IdChanged();
    partial void OnCourse_NameChanging(string value);
    partial void OnCourse_NameChanged();
    #endregion
	
	public CourseType()
	{
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Course_Id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int Course_Id
	{
		get
		{
			return this._Course_Id;
		}
		set
		{
			if ((this._Course_Id != value))
			{
				this.OnCourse_IdChanging(value);
				this.SendPropertyChanging();
				this._Course_Id = value;
				this.SendPropertyChanged("Course_Id");
				this.OnCourse_IdChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Course_Name", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
	public string Course_Name
	{
		get
		{
			return this._Course_Name;
		}
		set
		{
			if ((this._Course_Name != value))
			{
				this.OnCourse_NameChanging(value);
				this.SendPropertyChanging();
				this._Course_Name = value;
				this.SendPropertyChanged("Course_Name");
				this.OnCourse_NameChanged();
			}
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
}
#pragma warning restore 1591
