// פונקציה שמוסיפה את העיצוב
function startEffect(img) {
        img.style.transform = "scale(1.05)"; /* הגדלה של התמונה */
        img.style.boxShadow = "0px 10px 20px rgba(0,0,0,0.3)"; /* הוספת צל */
        img.style.transition = "0.4s"; /* הוספת אנימציה הדרגתית */
        img.style.filter = "saturate(1.05)"; /* הוספת רוויה */
}

function stopEffect(img) {
        img.style.transform = "scale(1)"; /* הקטנה של התמונה לגודל מקורי */
        img.style.boxShadow = "none"; /* הסרת צל */
        img.style.filter = "saturate(1)"; /* הסרת רוויה */
}