//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MVCSatisTakip.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_satis
    {
        public int SatisID { get; set; }
        public Nullable<decimal> SatisFiyat { get; set; }
        public Nullable<int> Satisadet { get; set; }
        public Nullable<System.DateTime> Satistarih { get; set; }
        public Nullable<int> Urun { get; set; }
        public Nullable<int> Musteri { get; set; }
    
        public virtual tbl_musteri tbl_musteri { get; set; }
        public virtual tbl_urun tbl_urun { get; set; }
    }
}
