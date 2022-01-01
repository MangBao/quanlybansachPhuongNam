<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BaoCao1.aspx.cs" Inherits="BT_NHOM.BaoCao.BaoCao1" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width"/>
    <title>Báo cáo</title>
    <script runat="server">
        void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                List<BT_NHOM.Models.v_Don_Dat_hang> baoCaos = null;
                using (BT_NHOM.Models.QLBSPhuongNamEntities dc = new BT_NHOM.Models.QLBSPhuongNamEntities())
                {
                    baoCaos = dc.v_Don_Dat_hang.OrderBy(a => a.MaHD).ToList();
                    ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/BaoCao/BaoCao.rdlc");
                    ReportViewer1.LocalReport.DataSources.Clear();
                    ReportDataSource reportDataSource = new ReportDataSource("BaoCao",baoCaos);
                    ReportViewer1.LocalReport.DataSources.Add(reportDataSource);
                    ReportViewer1.LocalReport.Refresh();
                }
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" AsyncRendering="false" SizeToReportContent="true" Height="100%" Width="100%">
            </rsweb:ReportViewer>
        </div>
    </form>
</body>
</html>
