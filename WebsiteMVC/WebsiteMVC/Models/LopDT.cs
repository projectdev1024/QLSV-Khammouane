//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebsiteMVC.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class LopDT
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LopDT()
        {
            this.KQHTs = new HashSet<KQHT>();
        }
    
        public int IDLopDT { get; set; }
        public Nullable<int> IDInfoKyHoc { get; set; }
        public Nullable<int> IDCTDT { get; set; }
        public Nullable<int> IDGiaoVien { get; set; }
        public Nullable<System.DateTime> TimeStart { get; set; }
        public Nullable<System.DateTime> TimeEnd { get; set; }
        public Nullable<int> Date { get; set; }
        public Nullable<int> Tiet { get; set; }
        public Nullable<int> IDLopHoc { get; set; }
        public Nullable<int> IDPhongHoc { get; set; }
    
        public virtual CTDT CTDT { get; set; }
        public virtual GiaoVien GiaoVien { get; set; }
        public virtual InfoKyHoc InfoKyHoc { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<KQHT> KQHTs { get; set; }
        public virtual LopHoc LopHoc { get; set; }
        public virtual PhongHoc PhongHoc { get; set; }
    }
}
