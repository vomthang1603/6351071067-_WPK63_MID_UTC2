using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;

namespace de1
{
    public partial class DefaultPageMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Kiểm tra nếu không phải là postback
            if (!IsPostBack)
            {
                // Sử dụng context để truy vấn dữ liệu từ cơ sở dữ liệu
                using (var context = new QLDoUongEntities())
                {
                    // Truy vấn danh mục cùng với số lượng đồ uống tương ứng
                    var categoriesWithBeverageCount = from c in context.Categories
                                                      join b in context.Beverages on c.CatID equals b.CatID into beverages
                                                      select new
                                                      {
                                                          c.CatID,
                                                          c.CatName,
                                                          BeverageCount = beverages.Count()
                                                      };

                    // Gán kết quả vào DataList
                    DataList1.DataSource = categoriesWithBeverageCount.ToList();
                    DataList1.DataBind();
                }
            }
        }

    }
}