using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BW4
{
    public class Product
    {
        public int Id { get; set; }
        public string Brand { get; set; }
        public string Category { get; set; }
        public string Title { get; set; }
        public decimal Price { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }
        public int Quantity { get; set; }
    }
}