<script>
function getDateTime() {
  const now = new Date();
  const date = now.toLocaleDateString("ar-IQ");
  const time = now.toLocaleTimeString("ar-IQ", {
    hour: '2-digit',
    minute: '2-digit'
  });
  return { date, time };
}

async function savePDF() {
  const { jsPDF } = window.jspdf;
  const pdf = new jsPDF();

  let phone = document.getElementById("phone").value;
  let location = document.getElementById("location").value;
  let reason = document.getElementById("reason").value;
  let imageFile = document.getElementById("image").files[0];

  const dt = getDateTime();

  pdf.setFontSize(14);
  pdf.text("زيارة الزبون", 150, 20, {align:"right"});
  pdf.text("التاريخ: " + dt.date, 150, 35, {align:"right"});
  pdf.text("الوقت: " + dt.time, 150, 45, {align:"right"});
  pdf.text("رقم الهاتف: " + phone, 150, 60, {align:"right"});
  pdf.text("موقع الزبون: " + location, 150, 75, {align:"right"});
  pdf.text("سبب الزيارة: " + reason, 150, 90, {align:"right"});

  if (imageFile) {
    const reader = new FileReader();
    reader.onload = function(e) {
      pdf.addImage(e.target.result, "JPEG", 20, 105, 160, 90);
      pdf.save("زيارة_زبون.pdf");
    };
    reader.readAsDataURL(imageFile);
  } else {
    pdf.save("زيارة_زبون.pdf");
  }
}
</script>
