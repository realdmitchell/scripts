.class final Lcom/nmi/mtv/app/ui/condor/main/MtvBaseActivity$17;
.super Ljava/lang/Object;
.source "MtvBaseActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nmi/mtv/app/ui/condor/main/MtvBaseActivity;->setViewParentalBlock(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 1242
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "arg0"    # Landroid/content/DialogInterface;
    .param p2, "arg1"    # I

    .prologue
    .line 1245
    const/4 v0, 0x0

    sput-object v0, Lcom/nmi/mtv/app/ui/condor/main/MtvBaseActivity;->mBlockedDialog:Landroid/app/AlertDialog;

    .line 1244
    return-void
.end method
