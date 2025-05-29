const functions = require("firebase-functions");
const admin = require("firebase-admin");
const nodemailer = require("nodemailer");

admin.initializeApp();

// Configure nodemailer with your email
const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: "jobinfos679@gmail.com",        // 🔁 Replace with your Gmail
    pass: "jobinfo123.",           // 🔁 Use App Password if 2FA is on
  },
});

// Trigger when a new user is added to Firestore
exports.sendEnrollmentEmail = functions.firestore
  .document("enrollments/{docId}")   // 👈 Replace with your collection path
  .onCreate((snap, context) => {
    const data = snap.data();
    const name = data.name;
    
    const job = data.job;
    const state = data.state;

    const mailOptions = {
      from: "jobinfos679@gmail.com",
      to: "poojaparakh05@gmail.com",  // 🔁 Replace with supervisor's email
      subject: "New Job Enrollment",
      text: `New enrollment: ${name} from ${state} has applied for ${job}.`,
    };

    return transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        console.log("Error sending email:", error);
      } else {
        console.log("Email sent:", info.response);
      }
    });
  });
