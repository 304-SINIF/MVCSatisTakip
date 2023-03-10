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
    using System.ComponentModel.DataAnnotations;

    public partial class tbl_musteri
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbl_musteri()
        {
            this.tbl_satis = new HashSet<tbl_satis>();
        }
    
        public int MusteriID { get; set; }
        [Required(ErrorMessage = "Girilmesi zorunlu alan")]
        public string MusteriAdsoyad { get; set; }
        [Required(ErrorMessage = "Girilmesi zorunlu alan")]
        [Phone(ErrorMessage ="Telefon numarası girilmelidir")]
        public string Telno { get; set; }
        [Required(ErrorMessage ="Girilmesi zorunlu alan")]
        [StringLength(11,MinimumLength =11,ErrorMessage ="TC 11 hane olmalıdır")]
        public string TC { get; set; }
        [Required(ErrorMessage = "Girilmesi zorunlu alan")]
        public string Adres { get; set; }
        [Required(ErrorMessage = "Girilmesi zorunlu alan")]
        public string Meslek { get; set; }
        [Required(ErrorMessage = "Girilmesi zorunlu alan")]
        public string Sehir { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_satis> tbl_satis { get; set; }
    }
}
